# Flutter Showcase

Flutter project to demo multiple strategies.

### For development

create a `config/config.json` file with the following content:
```json
{
  "SUPABASE_URL": "YOUR_SUPABASE_URL",
  "SUPABASE_ANON_KEY": "YOUR_SUPABASE_ANON_KEY"
}
```

To run the project with the configuration file, use the following command:
```bash
flutter run --dart-define-from-file="config/config.json"
```
