{%- set name = sls.split('.')[::-1][0] %}
{%- set ns = '/' + slspath + '/' + name %}

{{ ns }}/config:
  file.managed:
    - name: /opt/squid/squid.conf
    - source: salt://squid/files/squid.conf

{{ ns }}/container:
  dockerng.running:
    - name: squid
    - image: sameersbn/squid
    - environment:
      - TZ: "Europe/Stockholm"
    - port_bindings:
      - 3128:3128
    - binds:
      - /opt/squid/cache:/var/spool/squid3
      - /opt/squid/logs:/var/log/squid3
      - /opt/squid/squid.conf:/etc/squid3/squid.conf
