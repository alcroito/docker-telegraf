HOST_NAME=`hostname`

vnstat -i eth0 -d --json d | jq -r \
 ".interfaces[0].traffic.day | del(.[].id) | .[] | \"vnstat,host=$HOST_NAME tx=\\(.tx),rx=\\(.rx) \" + (\"\\(.date.year)-\\(.date.month)-\\(.date.day)T12:00:00Z\"|fromdateiso8601 * 1000000000 |tostring)"
#vnstat -i eth0 -d --json d | jq -r \
 #".interfaces[0].traffic.days | del(.[].id) | .[] | \"vnstat,host=hermes tx=\\(.tx),rx=\\(.rx) \" + (\"\\(.date.year)-\\(.date.month)-\\(.date.day)T12:00:00Z\"|fromdateiso8601 * 1000000000 |tostring)"
 #".interfaces[0].traffic.days | del(.[].id) | .[] | \"vnstat,host=hermes tx=\\(.tx),rx=\\(.rx) \" + (\"\\(.date.year)-\\(.date.month)-\\(.date.day)T12:00:00Z\"|strptime(\"%FT%H:%M:%SZ\") |tostring)"
 #".interfaces[0].traffic.days | del(.[].id) | .[] | \"vnstat,host=hermes tx=\\(.tx),rx=\\(.rx) \" + (\"\\(.date.year)-\\(.date.month)-\\(.date.day)\"|strptime(\"%Y-%m-%d\")|mktime * 1000000000 |tostring)"
