<template>
  <div class="main">
    <van-nav-bar title="疫苗预约系统"></van-nav-bar>

    <!-- <van-row type="flex" justify="center" class="line"> 疫苗预约系统 </van-row> -->

    <van-row type="flex" justify="center" class="img">
      <img src="/images/vaccine.png" style="width: 120px; height: 120px" />
    </van-row>

    <van-row type="flex" justify="center" class="line">
      <van-col span="3">&nbsp; </van-col>
      <van-col span="18">
        <van-cell-group>
          <van-field
            placeholder="请输入手机号"
            type="text"
            left-icon="manager"
          />
        </van-cell-group>
        <van-cell-group>
          <van-field placeholder="请输入密码" type="text" left-icon="lock" />
        </van-cell-group>
      </van-col>
      <van-col span="3">&nbsp; </van-col>

      <div style="margin: 16px; width: 160px">
        <van-button
          round
          block
          type="info"
          native-type="submit"
          @click="onClickLogin"
        >
          登录
        </van-button>
      </div>
    </van-row>

    <van-row type="flex" justify="center" class="line"> 新用户注册 </van-row>
  </div>
</template>

<script>
import Vue from "vue";
import { Button, NavBar, Col, Row, Field } from "vant";
import axios from "axios";

Vue.use(NavBar);
Vue.use(Col);
Vue.use(Row);
Vue.use(Field);

export default {
  name: "vanttest",
  components: {
    [Button.name]: Button,
  },

  methods: {
    onClickLogin() {
      //   axios.defaults.withCredentials = true;
      //   let d1 = axios.request({
      //     method: "get",
      //     url: "http://www.baidu.com",
      //   });
      //   console.log(d1);
      this.$router.push("/welcome");
    },
  },
};
</script>
