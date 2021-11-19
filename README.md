# Utilities

## shell scripts:

###Depêndencias:
  - É necessário ter o ffmpg instalado, use o comando:
    - sudo apt-get install -y ffmpg   

### Aplicações

#### ffmpg_reduzir.sh
  - como usar:
    - _./ffmpg_reduzir.sh /caminho/completo/arquivo_de_video.mp4_
    - exemplo: para converter todos os arquivos de uma pasta, use:
      - _./ffmpg_reduzir.sh $(find /home/user/Downloads -name "*.mp4" | sort)_
        - assim vai listar todos os arquivos mp4 da pasta com o caminho completo dos arquivos e vai ordená-los alfabeticamente
        - considere o arquivo de entrada como video.avi, então o arquivo de saída será convert_0001_video.avi.mp4 

---

#### ffmpg_extrair_audio.sh
  - como usar:
    - _./ffmpg_extrair_audio.sh /caminho/completo/arquivo_de_video.mp4_
    - exemplo: para extrair o audio de todos os arquivos de uma pasta, use:
      - _./ffmpg_extrair_audio.sh $(find /home/user/Downloads -name "*.mp4" | sort)_
        - assim vai listar todos os arquivos mp4 da pasta com o caminho completo dos arquivos e vai ordená-los alfabeticamente
        - considere o arquivo de entrada como video.avi, então o arquivo de saída será audio_0001_video.avi.mp3 




## python:
