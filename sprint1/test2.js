var CryptoJS = require("crypto-js");
 
// cifrado
 
var str = '123456';
 // Clave 16 bits
var key = '0123456789abcdef';
 // vector inicial vector inicial 16 bits
var iv = '0123456789abcdef';
 // clave y iv pueden ser iguales
 
key = CryptoJS.enc.Utf8.parse(key);
iv = CryptoJS.enc.Utf8.parse(iv);
 
var encrypted = CryptoJS.AES.encrypt(str, key, {
    iv: iv,
    mode: CryptoJS.mode.CBC,
    padding: CryptoJS.pad.Pkcs7
});
 
 // Convertir a cadena
encrypted = encrypted.toString();
 
 // el modo admite CBC, CFB, CTR, ECB, OFB, CBC predeterminado
 // relleno compatible con Pkcs7, AnsiX923, Iso10126
 // NoPadding, ZeroPadding, Pkcs7 predeterminado, que es Pkcs5
 
 // descifrar
var decrypted = CryptoJS.AES.decrypt(encrypted, key, {
    iv: iv,
    mode: CryptoJS.mode.CBC,
    padding: CryptoJS.pad.Pkcs7
});
 
 // Convertir a cadena utf8
decrypted = CryptoJS.enc.Utf8.stringify(decrypted);