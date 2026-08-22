'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"flutter_bootstrap.js": "9099a25c0856582650b24e33d7ddbd9f",
"version.json": "27d73a57d8790926563ab62ff32cb1ea",
"index.html": "4f37973d7fc291ca551d220671b030a8",
"/": "4f37973d7fc291ca551d220671b030a8",
"main.dart.js": "f8d0d655f4aa45f93e323d9699e4d6c6",
"resume/Koidio_Y._Ble%CC%81_Resume.pdf": "e866281ee4324fdde4e02da86c889e9e",
"flutter.js": "24bc71911b75b5f8135c949e27a2984e",
"favicon.png": "e54d1e9b43a9e65ad88c5fa43e1dac3b",
"icons/Icon-192.png": "63796b52825e6e6b5eee1005efd8e566",
"icons/Icon-maskable-192.png": "85bea32bdd49c39d6d2e6107cd5663ae",
"icons/Icon-maskable-512.png": "0f5f78700084322506c84ff88132d0f7",
"icons/Icon-512.png": "0f5f78700084322506c84ff88132d0f7",
"manifest.json": "17e88057f4526128f6ae97ef2c724fc5",
"assets/NOTICES": "f168256eeb8611ac8315117ca7946abe",
"assets/FontManifest.json": "c75f7af11fb9919e042ad2ee704db319",
"assets/AssetManifest.bin.json": "3136e38a3863204c98c238b7fa0d648a",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "b93248a553f9e8bc17f1065929d5934b",
"assets/packages/font_awesome_flutter/lib/fonts/Font-Awesome-7-Free-Regular-400.otf": "46be639d952abe98effde36da35e7701",
"assets/packages/font_awesome_flutter/lib/fonts/Font-Awesome-7-Brands-Regular-400.otf": "706b13a761d261d759c0a8d557ccfdcb",
"assets/packages/font_awesome_flutter/lib/fonts/Font-Awesome-7-Free-Solid-900.otf": "48b92e8451309fdcb73d294f0f6e9830",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/shaders/stretch_effect.frag": "40d68efbbf360632f614c731219e95f0",
"assets/AssetManifest.bin": "fd06f4fd9820ed3d89ea6892ad4c5a43",
"assets/fonts/MaterialIcons-Regular.otf": "e7069dfd19b331be16bed984668fe080",
"assets/assets/pics/half_body.JPG": "626e48011a4bca67da55c07ddab03f42",
"assets/assets/pics/white_background.JPG": "e5183813554411cbb6f078066ad56b26",
"assets/assets/pics/bio.png": "31853b27967bd7d9905a54deae675a45",
"assets/assets/pics/pic.png": "af60b5088b9562d10b9dcbc6ed662d6d",
"assets/assets/json/tech1.json": "ee728864df4970dcd386ab3124866add",
"assets/assets/json/tech4.json": "5ba250edfdce491a5e753a54ba9ea6bb",
"assets/assets/json/tech2.json": "c27e9a7600391167deebd3369bfc3e1a",
"assets/assets/json/tech3.json": "28ebb775708dcb0d493742338e99f209",
"assets/assets/degree/my_bachelor.png": "dea22e066efdf5f7f5903298caa93e45",
"assets/assets/logo/siikaa_ai.png": "092eb26c7d8adfadc27f9afdcd0dabac",
"assets/assets/logo/digba_gym_logo.png": "391f304ecca871c1bf099f7300d4ea87",
"assets/assets/logo/ma_cacaoyere.jpeg": "fbc03269620a3531e648e53e679b2ddd",
"assets/assets/logo/512_white_bk_inverted.png": "e9ee7ebdeee12ac1c3b4d568eab18d79",
"assets/assets/logo/bk_logo.png": "5bbb443a22b65392a0c01eb71c9f712c",
"assets/assets/logo/nkommo.png": "402568308eb60fa4967dc917e13a1b8a",
"assets/assets/logo/bled_logo.png": "0da2d663e1fb6faf6ede19466c548cb1",
"assets/assets/logo/siikaa_icon.png": "517a9e212845d4cc89df20a47cf43ffd",
"assets/assets/logo/babylon_ai.png": "9127fa9e5e68f3080b40304550e50ee2",
"assets/assets/logo/salon_booking_app_logo.png": "f4bdfa8ba8b2f571703299cf3ea541d2",
"assets/assets/logo/300_white_bk.png": "9e027915592e36801f12c08de282ff3d",
"assets/assets/logo/128_siikaa.png": "62e3231b37c9a36b542ec1fe887a0624",
"assets/assets/logo/512_white_bk.png": "e8c8974478aa203349a5568302b37dd9",
"assets/assets/portfolio/siikaa_cover.webp": "7d6e2e92dce59895d496233c63d0ffbd",
"assets/assets/portfolio/ma_cacaoyere_cover.webp": "fd18ea987519f760fa85096ba8ec07c7",
"assets/assets/portfolio/harmattan_cover.webp": "ac86b5261917441c9438102da3ffef21",
"assets/assets/portfolio/babylon_ai_cover.webp": "73e9506127e3787203e5065255d21624",
"assets/assets/portfolio/nkommo_cover.webp": "75c0beb6ce5f947eb494a8c7c3937222",
"assets/assets/portfolio/digba_gym_cover.webp": "9256516a37a74734bbaf6d61d689baf7",
"assets/assets/portfolio/salon_booking_cover.webp": "9c038969d0d5244d51e74700e15ba60d",
"assets/assets/portfolio/siikaa_ai_cover.webp": "7f6c4c2bd67aaf243cb5924f969eda04",
"canvaskit/skwasm.js": "8060d46e9a4901ca9991edd3a26be4f0",
"canvaskit/skwasm_heavy.js": "740d43a6b8240ef9e23eed8c48840da4",
"canvaskit/skwasm.js.symbols": "3a4aadf4e8141f284bd524976b1d6bdc",
"canvaskit/canvaskit.js.symbols": "a3c9f77715b642d0437d9c275caba91e",
"canvaskit/skwasm_heavy.js.symbols": "0755b4fb399918388d71b59ad390b055",
"canvaskit/skwasm.wasm": "7e5f3afdd3b0747a1fd4517cea239898",
"canvaskit/chromium/canvaskit.js.symbols": "e2d09f0e434bc118bf67dae526737d07",
"canvaskit/chromium/canvaskit.js": "a80c765aaa8af8645c9fb1aae53f9abf",
"canvaskit/chromium/canvaskit.wasm": "a726e3f75a84fcdf495a15817c63a35d",
"canvaskit/canvaskit.js": "8331fe38e66b3a898c4f37648aaf7ee2",
"canvaskit/canvaskit.wasm": "9b6a7830bf26959b200594729d73538e",
"canvaskit/skwasm_heavy.wasm": "b0be7910760d205ea4e011458df6ee01"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
