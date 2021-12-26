import Vue from 'vue';
import Router from 'vue-router';

Vue.use(Router);

const routes = [
  {
    path: '*',
    redirect: '/login'
  },
  {
    name: 'login',
    component: () => import('./view/login'),
    meta: {
      title: '登录'
    }
  },
  {
    name: 'welcome',
    component: () => import('./view/welcome'),
    meta: {
      title: '欢迎'
    }
  },
  {
    name: 'appointment',
    component: () => import('./view/welcome/appointment'),
    meta: {
      title: '预约'
    }
  },
];

// add route path
routes.forEach(route => {
  route.path = route.path || '/' + (route.name || '');
});

const router = new Router({ routes });

router.beforeEach((to, from, next) => {
  const title = to.meta && to.meta.title;
  if (title) {
    document.title = title;
  }
  next();
});

export {
  router
};
