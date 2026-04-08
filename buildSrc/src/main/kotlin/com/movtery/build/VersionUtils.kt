package com.movtery.build

import java.io.File
import java.security.MessageDigest

// Yes this is duplicate, no I don't care, this makes it able to live on its own
// You, yes you! can copy paste this anywhere and it will build! (just remember to change the destinationDir).

fun hashFileWithDigest(fileToHash: File, digest: MessageDigest) {
    fileToHash.inputStream().use { input ->
        val buffer = ByteArray(8192)
        var read: Int
        while (input.read(buffer).also { read = it } != -1) {
            digest.update(buffer, 0, read)
        }
    }
}

fun writeVersionFile(jarFile: File, versionFile: File) {
    val sha1 = MessageDigest.getInstance("SHA-1")
    hashFileWithDigest(jarFile, sha1)
    versionFile.writeText(sha1.digest().joinToString("") { "%02x".format(it) })
}

fun writeVersionFile(jarFileArray: Array<File>, versionFile: File) {
    val sha1 = MessageDigest.getInstance("SHA-1")
    jarFileArray.forEach { jarFile ->
        hashFileWithDigest(jarFile, sha1)
    }
    versionFile.writeText(sha1.digest().joinToString("") { "%02x".format(it) })
}