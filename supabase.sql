-- Wallets
create table if not exists wallets (
  user_id uuid references auth.users(id) primary key,
  balance int default 100,
  vault int default 0
);

-- Chip Requests
create table if not exists chip_requests (
  id bigserial primary key,
  user_id uuid references auth.users(id),
  amount int not null,
  status text default 'pending',
  created_at timestamp default now()
);

-- Profiles
create table if not exists profiles (
  id uuid references auth.users(id) primary key,
  role text default 'player'
);

-- Cashout function
create or replace function cashout()
returns void language plpgsql security definer as $$
begin
  update wallets set vault = vault + balance, balance = 0
  where user_id = auth.uid();
end; $$;

-- Withdraw function
create or replace function withdraw()
returns void language plpgsql security definer as $$
begin
  update wallets set balance = balance + vault, vault = 0
  where user_id = auth.uid();
end; $$;

-- Approve request (admin only)
create or replace function approve_request(rid bigint, amt int)
returns void language plpgsql security definer as $$
begin
  update chip_requests set status = 'approved' where id = rid;
  update wallets set balance = balance + amt
  where user_id = (select user_id from chip_requests where id = rid);
end; $$;
