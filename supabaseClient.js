// supabaseClient.js
// Configure your Supabase project here

const SUPABASE_URL = 'https://etrloqzktcqjgbxzmurr.supabase.co';
const SUPABASE_ANON_KEY = 'PASTE-YOUR-ANON-KEY-HERE'; // replace with your anon public key

// Initialize client
const { createClient } = supabase;
window.sb = createClient(SUPABASE_URL, SUPABASE_ANON_KEY);
