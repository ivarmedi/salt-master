{%- set name = sls.split('.')[::-1][0] %}
{%- set ns = '/' + slspath + '/' + name %}
{%- set service = salt['pillar.get']('services:' + name) %}
{%- set force = salt['pillar.get']('force', False) %}

{%- for file in service.files|default([]) %}
{{ ns }}/file/{{ file.path }}:
  file.managed:
    - name: {{ file.path }}
    - source: {{ file.source }}
    - user: {{ file.user|default("root") }}
    - group: {{ file.group|default("root") }}
    - mode: {{ file.mode|default("0644") }}
{%- endfor %}

{% include '_templates/service/run.jinja' %}
