# Mony

Atur **brightness, contrast, resolusi, dan color profile** monitor eksternal dari Mac Apple Silicon, apa pun merk monitornya. Gratis.

<p>
  <img src="images/popover-light.png" width="300" alt="MonyBar light">
  <img src="images/popover-dark.png" width="300" alt="MonyBar dark">
</p>

## Unduh

Unduh versi terbaru yang stabil dari [Releases](../../releases/latest):

| File | Isi |
|---|---|
| `Mony-<versi>.dmg` | App menu bar `MonyBar.app` dengan slider, resolusi rekomendasi, preset, dan hotkey |
| `Mony-<versi>-monyctl.zip` | CLI untuk skrip dan shortcut |

Rilis yang ditandai **Latest** di halaman Releases selalu versi stable yang direkomendasikan.

## Persyaratan

macOS 13+ pada Apple Silicon. Monitor harus mengaktifkan DDC/CI di menu OSD agar brightness hardware bisa dikontrol.

## Pemasangan

### Lewat Homebrew

```sh
brew tap geezowl/mony https://github.com/geezowl/mony
brew install --cask mony
```

Update dengan `brew upgrade --cask mony`. Jika macOS memblokir app saat pertama dibuka, jalankan `xattr -cr /Applications/MonyBar.app`.

### Manual

1. Buka file `.dmg`, lalu seret `MonyBar.app` ke folder `Applications`.
2. Build ini belum di-notarize. Saat pertama dibuka, klik kanan `MonyBar.app` → **Open** → **Open**. Atau jalankan:
   ```sh
   xattr -cr /Applications/MonyBar.app
   ```
3. Untuk CLI: unzip, lalu `xattr -cr monyctl && chmod +x monyctl && mv monyctl /usr/local/bin/`.

Untuk update, MonyBar mengecek rilis baru di GitHub sekali sehari dan menampilkan link unduhan di popover. Pengecekan ini bisa dimatikan di **Settings → Check for updates**. Unduh DMG baru dan timpa `MonyBar.app` yang lama, atau jalankan `brew upgrade --cask mony`.

## Fitur

- Brightness dan contrast monitor eksternal lewat DDC/CI; layar bawaan lewat DisplayServices.
- Fallback software dimming (gamma) untuk monitor yang tidak mendukung DDC.
- Resolusi: default 5 pilihan rekomendasi ("Larger Text" sampai "More Space"); mode advanced menampilkan semua mode.
- Color profile ICC per display, dengan tombol reset ke profil bawaan.
- Preset: simpan dan terapkan kombinasi brightness, contrast, resolusi, dan color profile.
- Sinkron brightness ke semua monitor dan hotkey global ⌃⌥⌘ ↑/↓.
- Notifikasi versi baru di popover.

## Lisensi

Freeware. Gratis dipakai dan dibagikan tanpa modifikasi; source code tidak dirilis. Lihat [LICENSE](LICENSE).

## Masalah

Laporkan lewat [Issues](../../issues). Set `MONY_DEBUG=1` untuk log DDC mentah ke stderr dan lampirkan di laporan.
