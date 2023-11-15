
mono /app/duplicati/Duplicati.CommandLine.exe backup file:///backups/ /source/ --backup-name=Zerbitzariak --dbpath=/config/XRWMYCMKZS.sqlite --encryption-module= --compression-module=zip --dblock-size=50mb --keep-versions=3 --no-encryption=true --disable-module=console-password-input

if [ $? -eq 0 ]; then
  # Si el comando fue exitoso, elimina este script
  rm -- "$0"
fi