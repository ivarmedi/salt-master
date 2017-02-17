{%- set name = sls.split('.')[::-1][0] %}
{%- set ns = '/' + slspath + '/' + name %}

{{ ns }}/repository:
  pkgrepo.managed:
    - name: "deb https://apt.dockerproject.org/repo/ debian-{{ salt['grains.get']('oscodename') }} main"
    - key_url: https://apt.dockerproject.org/gpg

{{ ns }}/install:
  pkg.latest:
    - name: docker-engine
    - require:
      - pkgrepo: {{ ns }}/repository
