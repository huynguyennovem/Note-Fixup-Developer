keytool -genkey -v -keystore /home/huynq/Documents/Working/projects/reproduce_sample/upload-keystore.jks -keyalg RSA -keysize 2048 -validity 10000 -alias upload -storetype JKS

bundletool build-apks --bundle=/home/huynq/Documents/Working/projects/reproduce_sample/build/app/outputs/bundle/release/app-release.aab --output=/home/huynq/Documents/Working/projects/reproduce_sample/build/app/outputs/bundle/release/app-release.apks --ks=/home/huynq/Documents/Working/projects/reproduce_sample/upload-keystore.jks --ks-pass=pass:123456 --ks-key-alias=upload --key-pass=pass:123456

bundletool install-apks --apks=/home/huynq/Documents/Working/projects/reproduce_sample/build/app/outputs/bundle/release/app-release.apks

-----------------------------------------
Fix "Integrity check failed: java.security.NoSuchAlgorithmException: Algorithm HmacPBESHA256 not available"


keytool -importkeystore -srckeystore /home/huynq/Documents/Working/projects/reproduce_sample/upload-keystore.jks -destkeystore /home/huynq/Documents/Working/projects/reproduce_sample/upload-keystore.p12 -deststoretype PKCS12

openssl pkcs12 -nodes -in upload-keystore.p12 -out upload-keystore.pem

openssl pkcs12 -export -in upload-keystore.pem -out new-upload-keystore.p12 -name upload

