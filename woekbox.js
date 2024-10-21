import { MapRoute } from 'workbox-routing';

const mapRoute = new MapRoute({
  prefix: '/my-prefix/',
  handler: new CacheFirst({
    cacheName: 'my-cache',
  }),
});

registerRoute(mapRoute);
