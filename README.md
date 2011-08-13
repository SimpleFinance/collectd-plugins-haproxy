collectd-plugins-haproxy
========================

Overview
--------
`haproxy-stats` is a collectd plugin for gathering statistics from haproxy via the statistics socket.


Configuration
-------------

Usage
-----

<pre>$ ./haproxy-stats -h
Usage: haproxy-stats [options]

        --socket=SOCKET              Location of the haproxy stats socket
                                     Default: /var/run/haproxy.stats
    -i, --interval=INTERVAL          Interval between data collection
                                     Default: 10
    -H, --hostname=HOSTNAME          Hostname
                                     Default: kailash.local
    -s, --single                     Run in single-shot mode

Debugging options
    -f, --file=FILE                  Read sample data from a CSV file

Common Options
    -h, --help                       Shows this message
    </pre>

Testing Mode
-------------
You can test the output of the plugin by supplying a test file with a csv captured from the statistics socket using e.g. the `socat` tool:

    > echo "show stat" | socat unix-connect:/var/run/haproxy.stats stdio > ./sample.csv

Then you can test the output using the `-f FILE` option.  This will make the plugin run in single-shot mode and return directly after processing the file data.

Licence and Author
-------------------

Author::   James Casey (<james@banksimple.com>)

Copyright 2011 Simple Finance Corp.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

     http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.