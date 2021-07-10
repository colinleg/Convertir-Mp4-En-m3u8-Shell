# Mp4ToM3u8

Convert mp4 files to multiples ts files and a m3u8 file.

mp4ToM3u8 est un script ( utiliser de préférence 'multipleFiles' ), qui permet de convertir un fichier mp4 en plusieurs fragments ayant l'extension .ts.
Un fichier m3u8 est également généré et permet la mise en ligne de vidéos ( par exemple avec hls-server ) qui pourront par la suite être exploitable comme flux HTTP
( par exemple hls.js ) 

Il utilise ffmpeg pour convertir le mp4 en ts + m3u8.

### Utilisations possibles : 

- avec GNOME sous Ubuntu : ne pas oublier de rendre executable le script ( dans propriétés ) 

  1 ) Clic droit sur n'importe quel dossier dans l'explorateur > Ouvrir le dossier de scripts > Copier le .sh ici 
  -> ce qui permet ensuite : - de se placer dans le dossier composé de plusieurs fichiers vidéos. Puis clic droit > scripts > mp4Tom3u8
  
  2 ) placer le script directement dans le fichier, ouvrir un terminal puis ;

  ```bash 
  bash mp4ToM3u8-multipleFiles.sh
  ```
  
### Fonctionnement : 
  
  Crée un dossier pour chaque vidéo : "hls-nomDeLaVideo", dans lequel se trouve trois sous dossiers : 1080, 720 et 360 qui correspondent aux résolutions 1920x1080, 
  1280x720 et 640x360. Dans chaque sous-dossier se trouve un fichier m3u8 ainsi que plusieurs fichiers.ts, plus ou moins selon la longueur de la vidéo.
  
  On retrouve donc la même vidéo trois fois en différentes résolutions, sous forme de fragments.
