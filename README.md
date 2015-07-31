# 启动持续运行openstack-client，然后运行openstack client命令
```bash
docker run -d \
--name openstack-client \
-e OS_USERNAME=USERNAME \
-e OS_PASSWORD=PASSWORD \
-e OS_USER_DOMAIN_ID=default \
-e OS_PROJECT_NAME=admin \
-e OS_PROJECT_DOMAIN_ID=default \
-e OS_AUTH_URL=http://CONTROLLER:35357/v3 \
-e OS_REGION_NAME=RegionOne \
-e OS_IDENTITY_API_VERSION=3 \
-e OS_IMAGE_API_VERSION=2 \
-e OS_VOLUME_API_VERSION=2 \
luckpenguin/openstack-client

docker exec openstack-client openstack image list
```
# 直接运行openstack client命令
```bash
docker run --rm \
-e OS_USERNAME=USERNAME \
-e OS_PASSWORD=PASSWORD \
-e OS_USER_DOMAIN_ID=default \
-e OS_PROJECT_NAME=admin \
-e OS_PROJECT_DOMAIN_ID=default \
-e OS_AUTH_URL=http://CONTROLLER:35357/v3 \
-e OS_REGION_NAME=RegionOne \
-e OS_IDENTITY_API_VERSION=3 \
-e OS_IMAGE_API_VERSION=2 \
-e OS_VOLUME_API_VERSION=2 \
luckpenguin/openstack-client \
openstack image list
```