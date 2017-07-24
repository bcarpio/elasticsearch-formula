#
include:
  - elasticyumrepo

elasticsearch_package:
  pkg.installed:
     - name: elasticsearch

elasticsearch_config:
  file.managed:
     - name: /etc/elasticsearch/elasticsearch.yml
     - source: salt://elasticsearch/files/elasticsearch.yml
     - template: jinja

elasticsearch_service:
  service.running:
    - name:  elasticsearch
    - enable: True
    - watch:
      - file: /etc/elasticsearch/elasticsearch.yml
