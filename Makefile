
export GOOS=linux
export GOARCH=amd64
S3BUCKET=s3://jtdv-serverless-go/zips/

clean:
	rm -f main && rm -f *.zip

build: clean
	go build -o main $(main)

zip: build
	zip $(outzip) main

all: zip
	aws-vault exec $(user) -- aws s3 cp $(outzip) $(S3BUCKET)
