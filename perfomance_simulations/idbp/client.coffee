crypto = require 'crypto';
ecc = require 'elliptic';
fs       = require 'fs';

EC = ecc.ec;
ec = new EC('secp256k1');
prkey = "8e8f61c213e6ad81888bca3972a3adac6df6f1f40303b910dd3a6b04a2137175"
key = ec.keyFromPrivate(prkey,'hex');;

username = "V11@email.cz"    
password = "slovensko1"
str = username.concat(password)
msg = crypto.createHash("sha256").update(str).digest('hex'); 
key_user = ec.keyFromPrivate(msg,'hex'); 
public_key = key_user.getPublic().mul(key.getPrivate()).encode('hex')

str = username.concat("\t").concat(password).concat("\t").concat(key.getPrivate("hex")).concat("\t").concat(public_key).concat("\t").concat(msg)
fs.writeFileSync('client.txt', str)

user_pass = "042611d8bbdefaf509fa4775dad17af0cb10e51f935092d246818479f70037d7e64cbb8fdfe2c17e3d8ea38001057b81340f80420718e2ca22793f5647b48cf0d2"

pass_list = [ '044ee087dd80b9ef5346258cdb571e784b8702e26396e2f1e26fcf3c7707a0705e5acd310791506b9b627cb55df042a185aff1fe691b938b6df56a407e77d1dfd0','0479e50248149b43829496df27c492b3317fb475bdbc27e9fb8a7613b60ff82b033a1928abf94c931b15be254c44b75b17b30ed8e0427406e2eb1e48b3817b5c5c','044137c47a7365a43c6b2c4929d3eeb0dfb422616a52fe3d616caff797615aae2589904c50efed71573516f212f3adbcbb6c4ecdd157eb9e1661ed003cc271d648','048ca77ddf7c52d713b566027860fdeef30f0975b47d2853ac8a1c3c5f18f6cc417e67be9110c125caee030d35f1276fd8d28edaceac405833376553fbf956efa4','042eb9b51cfb98e09487e202e6ae7b20bbc4862b1e931da08e17d19f867fb451b75e9268a9184cb91d9449bd3529784a8711af3970cbfd49ac1d40f098d5278636','04547aeadfd118d40190757854df28e76b9e3da127516630ba4ee93929b9e8a8f9e8c522614fd492b13113804c88babd32a7293f38b5a873e150dd73fdc0128476','04736b9aaf58f13bc0bd9708a8722c8d0cff43acdd6160bc8a950d1007f03eaa30c76fd525e18a5232dc8687ec5c4315419a5f598c391e3866d164fe57fc956957','04e0e718dcc553ef0ad128a999cb1b6871fc322f7761256e62adfc6d57e33e279c73dcc9c9f930413d8f6683b8dfa5d40a116a4688cf1c21a9b2ad91f01a86c554','042446c9a10e0fbff5c36187e9cd363e40dd65c7e3fffef136a350d5536d404b330e84ef3a924f4e395975def154a8e12c6218c32fb3ed329d57c7d1cadc82d564','046b54115fba0e95a698f948d74cd13161331fa9937d818a2221fcfeaff7963861eab47d9a5e5425417d927eb1531f2003cf018ff972dfe171527df5563b893a85','0407c8f7d6a3af3188f581cf295b901d183e34caa0ff042dfecd6fc7ea7981499a828b88ea167cee395657a0b411992eb3ab0dc1bd0910c0e120d4a1c26da80b17','04839ddc0cc5556717c1e9fc473ce93965142252b1ffa81c3787314a2fdb171e9358799f5c267092dc92fcf8e3238f020d2470f29399a51ad7c4b50d0aea15d0be','0406821f58ddeee09e5105e8d68164473ef3a208625c6fa0aed801909e9b4d85a6aceba47cab3ee26e6cd2b24f081b7e47e75897184504a963140e1455f4288b24' ] 

for elem in pass_list
    enc_userpass_pub = ec.keyFromPublic(elem,'hex');
    enc_userpass_enc = enc_userpass_pub.getPublic().mul(key.getPrivate()).encode('hex')
    if enc_userpass_enc == user_pass
        console.log(elem)
        console.log("happy")
