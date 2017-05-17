{%- set name = sls.split('.')[::-1][0] %}
{%- set ns = '/' + slspath + '/' + name %}

{{ ns }}/config:
  file.managed:
    - name: /opt/squid/squid.conf
    - source: salt://squid/files/squid.conf

{{ ns }}/container:
  dockerng.running:
    - name: squid
    - image: ivarmedi/squid
    - environment:
      - TZ: "Europe/Stockholm"
    - port_bindings:
      - 3128:3128
      - 3130:3130
    - binds:
      - /opt/squid/cache:/var/spool/squid
      - /opt/squid/logs:/var/log/squid
      - /opt/squid/ssl:/etc/ssl/squid
      - /opt/squid/squid.conf:/etc/squid/squid.conf
