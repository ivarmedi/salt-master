{%- set name = sls.split('.')[::-1][0] %}
{%- set ns = '/' + slspath + '/' + name %}

{{ ns }}/container:
  dockerng.running:
    - name: plex
    - image: plexinc/pms-docker
    - network_mode: host
    - environment:
      - TZ: "Europe/Stockholm"
      - PLEX_UID: "1001"
      - PLEX_GID: "1001"
    - binds:
      - /opt/plex/config:/config
      - /tmp/transcode:/transcode
      - /mnt/media:/mnt/media
