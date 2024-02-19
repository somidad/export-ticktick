# Ticktick Exporter

## Usage

- Download and execute `export-ticktick`
- When a prompt `Enter code:` appears, visit [here](https://ticktick.com/oauth/authorize?scope=tasks:read&client_id=L3kCTCHx8Nyw982O4x&response_type=code) to authorize this app
- When a code appears, enter it to the prompt
- Select a list to export and wait for the app to finish

## Limitations

- Exporting Inbox is not supported
- Attachments are not downloaded

## Build from source

- [ ] TBU for prerequisites and dependencies

Windows:

```powershell
cd _scripts
.\build-win.ps1
```
Linux:

```powershell
cd _scripts
./build-linux.ps1
```

macOS:

```powershell
cd _scripts
./build-mac.ps1
```
