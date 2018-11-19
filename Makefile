build:
	rm -rf public
	hugo

deploy: build
	aws s3 sync public/ s3://kumasan.space --acl public-read --delete
	aws configure set preview.cloudfront true
	aws cloudfrong create-invalidation --distribution-id E6BO2AHW0DERQ --paths '/*'

