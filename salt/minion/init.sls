include:
- salt.minion.service
- salt.minion.grains
{%- if pillar.salt.minion.graph_states is defined %}
- salt.minion.graph
{%- endif %}
{%- if pillar.salt.minion.ca is defined %}
- salt.minion.ca
{%- endif %}
{%- if pillar.salt.minion.cert is defined %}
- salt.minion.cert
{%- endif %}

# Fixes bug where nova state and keystone state return python-six errors
salt_keystone_py:
  file.line:
    - name: /usr/lib/python2.7/dist-packages/salt/modules/keystone.py
    - mode: replace
    - match: "import salt.ext.six"
    - content: "import six"
