{%- set name = sls.split('.')[::-1][0] %}
{%- set ns = '/' + slspath + '/' + name %}
{%- set service = salt['pillar.get']('services:' + name) %}

{% include '_templates/service/run.jinja' %}
