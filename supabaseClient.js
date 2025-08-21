// supabaseClient.js
// Load the Supabase client on every page that needs it.
// Make sure your HTML includes:
// <script src="https://unpkg.com/@supabase/supabase-js@2"></script>
// <script src="supabaseClient.js"></script>

const SUPABASE_URL = 'https://etrloqzktcqjgbxzmurr.supabase.co';
const SUPABASE_ANON_KEY = 'YOUR-ANON-PUBLIC-KEY'; // <-- paste your anon key here

// Reuse a single client across page reloads
window.sb = window.sb || supabase.createClient(SUPABASE_URL, SUPABASE_ANON_KEY);
