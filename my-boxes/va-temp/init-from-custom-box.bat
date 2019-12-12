set MY_BOXES_DIR=D:/tp/vagrant/my-boxes
set BOX_NAME=with-docker-java-node
set MY_BOXES_URL=file:///%MY_BOXES_DIR%/%BOX_NAME%.box
vagrant init %BOX_NAME% %MY_BOXES_URL%