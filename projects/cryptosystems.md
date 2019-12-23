---
layout: project
title: Cryptosystems
date: September—December 2018
---

**Project Link:** [https://github.com/BerkeleyBlockchain/Cryptography](https://github.com/BerkeleyBlockchain/Cryptography)

#### Technologies Used
Python, Pytest

#### Summary
This was my first semester internal project for [Blockchain at Berkeley's](https://blockchain.berkeley.edu/) Education Department.

The goal of the project was to learn about and implement the most common cryptographic schemes, which included RSA,
Shamir's secret sharing, and ECDSA.

##### RSA

Here's a basic outline of what we implemented.
* `gcd(x, y)`
    * A function that quickly calculates the GCD for use in determining if two numbers x, y are coprime `gcd(x, y) == 1`
    * Used Euclid's "extended GCD" algorithm to quickly find an inverse in a mod field.
    * `gcd(x, y) = gcd(y, x mod y)`
* `is_prime(x)`
    * (Efficiently) checks whether or not a (very large) number is prime. RSA operates on the order of 512-bit prime
      numbers, so efficiency was really important here.
    * Implemented the Miller-Rabin primality test.
    * Created a list of small primes to check through before running Miller-Rabin to save time in a lot of cases.
* `encrypt(keypair, unencrypted)`
    * Encrypt a message with a public/private key pair.
    * This amounts to modular exponentiation: `E(x) = x^e mod pq`
    * I implemented Chinese Remainder Theorem for quick modular exponentiation.
* `decrypt(keypair, encrypted)`
    * Decrypt an encrypted message with a corresponding key pair.
    * This amounts to another round of modular exponentiation, using `d = e^-1 mod (p-1)(q-1)`: `D(y) = y^d mod pq`

Below is an example of how you could use the script:

{% highlight python%}
rsa = RSA(name='Justin')
msg = 'Hello, world!'
encrypted = rsa.encrypt(msg)
decrypted = rsa.decrypt(encrypted)
print(decrypted) # Hello, world!
{% endhighlight %}

##### Secret Sharing

A secret-sharing scheme tries to split up some secret `s` among `n` individuals, where `k` individuals need
to come together to access `s`. Any fewer will result in a garbage answer and force a brute-force computation
to try finding the secret.

To do this, we use the property that an `(k-1)`-degree polynomial is defined uniquely on `k` points. We generate
a random polynomial `f(x)` that satisfies `f(0) = s`. If we evaluate the polynomial at 0, then we get the secret.
This polynomial will be degree `(k-1)`, and each share will be a point `(i, f(i))` on the polynomial. Hand out
`n` unique shares to the `n` individuals. `k` individuals can come together to recreate the polynomial `f(x)`
by using Lagrange interpolation. Otherwise, the polynomial cannot be uniquely determined, so `f(0)` of the
"recovered" polynomial could be any value.

Below is an outline of what we implemented.

* `lagrange_interpolation`
    * Solve for the unique `(n-1)`-degree polynomial that is uniquely defined on `n` points, in a mod field.
* `div_mod`
    * Computes the result of dividing a number by another number in a given modulus.
* `extended_GCD`
    * Computes the inverse of a number in a mod field.
* `generate_random_shares`
    * Generate random shares that each represent a point on a polynomial.
* `generate_polynomial`
    * Generate a random polynomial `f` such that `f(0) = secret`.
* `recover_secret`
    * Recover the secret using the given share points, employing `lagrange_interpolation`

##### ECDSA

ECDSA stands for Elliptic Cryptography Digital Signature Algorithm. We implemented a basic elliptic curve
cryptography scheme, which is used in Bitcoin to generate public keys.

Take a look at what a Bitcoin address generation script looks like (don't use this private key!!):

{% highlight python %}
from curve import Curve, FiniteCurve
from random import randrange
import hashlib
from hashlib import sha256
import base58check

# Params for secp256-k1 (Curve that Bitcoin uses)
# http://www.secg.org/sec2-v2.pdf
_a = 0x0000000000000000000000000000000000000000000000000000000000000000
_b = 0x0000000000000000000000000000000000000000000000000000000000000007
_p = 0xfffffffffffffffffffffffffffffffffffffffffffffffffffffffefffffc2f
_Gx = 0x79be667ef9dcbbac55a06295ce870b07029bfcdb2dce28d959f2815b16f81798
_Gy = 0x483ada7726a3c4655da4fbfc0e1108a8fd17b448a68554199c47d08ffb10d4b8
_n = 0xfffffffffffffffffffffffffffffffebaaedce6af48a03bbfd25e8cd0364141

curve_secp256k1 = FiniteCurve(_a, _b, (_Gx, _Gy), _p, _n)

# https://en.bitcoin.it/wiki/Technical_background_of_version_1_Bitcoin_addresses

private_key = 0x3969E7AF7D041E2E8527972682E805DF63EFA7841828171C769CB3AD5FD23330
public_key = curve_secp256k1.scalar_mul(private_key)
public_key = hex(public_key[0]) # The x-coord is the compressed public key.
public_key = '02' + str(public_key)[2:]

print(public_key)

s1 = sha256(public_key.encode('utf-8')).hexdigest()
r = '00' + hashlib.new('ripemd160', s1.encode('utf-8')).hexdigest()
s2 = sha256(r.encode('utf-8')).hexdigest()
s3 = sha256(s2.encode('utf-8')).hexdigest()
checksum = s3[:8]
binary_address = r + checksum

print(binary_address)
{% endhighlight %}