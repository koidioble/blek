'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"flutter_bootstrap.js": "8ca5beb830e933f34549f4db6cbe7a1a",
"version.json": "27d73a57d8790926563ab62ff32cb1ea",
"index.html": "771d2b2ee43dad9c66b8d773a678390c",
"/": "771d2b2ee43dad9c66b8d773a678390c",
"main.dart.js": "9e4fb27fdf9e5ab1302fd2a3f37c2cd4",
"flutter.js": "83d881c1dbb6d6bcd6b42e274605b69c",
"favicon.png": "e4614a67957b5141cd11583e139407ad",
"icons/Icon-192.png": "94939596324c48725ab5167ded61489d",
"icons/Icon-maskable-192.png": "94939596324c48725ab5167ded61489d",
"icons/Icon-maskable-512.png": "8e2a166cdeff64a6ac9eb6ed7f7dc8b1",
"icons/Icon-512.png": "8e2a166cdeff64a6ac9eb6ed7f7dc8b1",
"manifest.json": "a2ffccffa56bfac5ae98ae08b5e9aed5",
"assets/AssetManifest.json": "f6070550a3ece2ebc5ce3e6394d25f93",
"assets/NOTICES": "1da76dfaa354d6307656a4ae3017a35f",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/AssetManifest.bin.json": "391c7777390be17115d7d0817522c0e6",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "33b7d9392238c04c131b6ce224e13711",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/AssetManifest.bin": "a514614ee4b4abc544e57ec94a381867",
"assets/fonts/MaterialIcons-Regular.otf": "1da612104ee6b39c2cb47c392a50d473",
"assets/assets/pics/consultant2_min.png": "b9f902b0f6c681f41d5f6fa8d7116757",
"assets/assets/pics/consultant1_min.png": "866726e148e6eb4712ea71ba8066fc27",
"assets/assets/pics/contact3_min.png": "a1670bfe58e86cebf1718f651ab666fa",
"assets/assets/pics/contact2_min.png": "ce61db1a45fef08c8fc34a6e61cca914",
"assets/assets/pics/about1.png": "dc00324dc0c596d6d39ceccb4ab39913",
"assets/assets/pics/pic.png": "af60b5088b9562d10b9dcbc6ed662d6d",
"assets/assets/pics/contact1_min.png": "5f927c2e229d5053734c0c939d22854a",
"assets/assets/logo/bled_logo512.png": "d3a8f31423ff5a8cf9ec6db8b9b461ee",
"assets/assets/logo/IMG_1859.png": "1e358e35aa34190f07da6b90db73ce4a",
"assets/assets/logo/bk_logo.png": "5bbb443a22b65392a0c01eb71c9f712c",
"assets/assets/logo/github_logo.png": "aafa237b9fa15efeea2bf957e311f179",
"assets/assets/logo/siikaa_icon_logo.png": "74bda9aa5c1d9f467eec592d985e0dd2",
"assets/assets/logo/instagram_logo.png": "da3e4fda686612ac5ecd11bf341f64e7",
"assets/assets/logo/siikaa_olive.png": "82fb865a26751825bf469ee366486800",
"assets/assets/logo/gmail_logo.png": "7f1d37c86aa8f6979747a62ca263c759",
"assets/assets/logo/300_white_bk.png": "9e027915592e36801f12c08de282ff3d",
"assets/assets/logo/linkedin_logo.png": "596eb5ed0c92d09350e3d199609bf6de",
"assets/assets/logo/128_siikaa.png": "62e3231b37c9a36b542ec1fe887a0624",
"assets/assets/logo/512_white_bk.png": "e8c8974478aa203349a5568302b37dd9",
"canvaskit/skwasm.js": "ea559890a088fe28b4ddf70e17e60052",
"canvaskit/skwasm.js.symbols": "e72c79950c8a8483d826a7f0560573a1",
"canvaskit/canvaskit.js.symbols": "bdcd3835edf8586b6d6edfce8749fb77",
"canvaskit/skwasm.wasm": "39dd80367a4e71582d234948adc521c0",
"canvaskit/chromium/canvaskit.js.symbols": "b61b5f4673c9698029fa0a746a9ad581",
"canvaskit/chromium/canvaskit.js": "8191e843020c832c9cf8852a4b909d4c",
"canvaskit/chromium/canvaskit.wasm": "f504de372e31c8031018a9ec0a9ef5f0",
"canvaskit/canvaskit.js": "728b2d477d9b8c14593d4f9b82b484f3",
"canvaskit/canvaskit.wasm": "7a3f4ae7d65fc1de6a6e7ddd3224bc93"};
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
