# Waleed Logs

A personal tracker for training, habits and food, in a single page (`index.html`, no build step).

- **Training**: daily body weight with a trend chart, plus a box for each exercise with its own chart (weight line, reps bars) and progress stats.
- **Habits**: add yes/no habits (vitamins) or amount habits with a daily goal (water). Each gets a streak, 7-day score and daily bar chart.
- **Macros**: set daily calorie, protein, carb and fat targets, log food each day and see remaining amounts and history charts.

## Running it

Open `index.html` in a browser or deploy the repo as a static site (Vercel, GitHub Pages).

Logs sync across devices through Supabase. Sign in with the same email on every device.
The database setup is in `supabase/schema.sql` (run it once in the Supabase SQL Editor).
Inside the Claude artifact, data is saved to your Claude account instead.
