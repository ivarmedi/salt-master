{%- set name = sls.split('.')[::-1][0] %}
{%- set ns = '/' + slspath + '/' + name %}

{{ ns }}/prereq:
  pkg.latest:
    - names:
      - apt-transport-https
      - ca-certificates
      - curl
      - software-properties-common

{{ ns }}/repository:
  pkgrepo.managed:
    - name: "deb https://download.docker.com/linux/ubuntu {{ salt['grains.get']('oscodename') }} stable"
    - key_url: https://download.docker.com/linux/ubuntu/gpg

{{ ns }}/install:
  pkg.latest:
    - name: docker-ce
    - require:
      - pkgrepo: {{ ns }}/repository
