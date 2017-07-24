#
elastic_repo:
  pkgrepo.managed:
    - humanname: Elastic
    - baseurl: https://artifacts.elastic.co/packages/5.x/yum
    - file: /etc/apt/sources.list.d/logstash.list
    - gpgkey: https://artifacts.elastic.co/GPG-KEY-elasticsearch
    - gpgcheck: 1

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
