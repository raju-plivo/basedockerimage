# basedockerimage 
# Version 1.0
Following details is defailt user and password for ssh auth:

To Pull this image please run following command :
	docker pull rajugupta15/basedockerimage:1.0

To create container run following command :	
	docker run -d\
			-p 22 \
			rajugupta15/basedockerimage
NOTE : user : baseimage and password : baseimage

If you want to use custom username and password for ssh then send username and password as environment variable.
docker run -d\
        -p 22 \
        -e "SSH_USER=baseimage"\
        -e "SSH_PASSWORD=baseimage" \
        rajugupta15/basedockerimage

If you want to use custom time-zone then send time_zone as environment variable (Detailt time zone will be "Etc/UTC").
docker run -d\
        -p 22 \
        -e "SSH_USER=baseimage"\
        -e "SSH_PASSWORD=baseimage" \
        -e "TIME_ZONE:-'Etc/UTC'" \
        rajugupta15/basedockerimage
