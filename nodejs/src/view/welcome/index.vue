<template>
  <div class="main">
    <van-nav-bar title="用户中心"></van-nav-bar>
    <br />
    <div style="margin: 16px">
      <van-button
        round
        block
        type="info"
        native-type="submit"
        @click="showPopup"
      >
        我的接种记录（已接种2针）
      </van-button>
    </div>
    <br />
    <br />
    <br />
    <div style="margin: 16px">
      <van-button
        round
        block
        type="info"
        native-type="submit"
        @click="onClickAppointment"
      >
        开始预约
      </van-button>
    </div>
    <br />
    <br />
    <br />
    <div style="margin: 16px">
      <van-button
        round
        block
        type="info"
        native-type="submit"
        @click="showQrPopup"
      >
        接种二维码（未实现）
      </van-button>
    </div>

    <van-popup v-model="show" style="width: 350px">
      <van-cell-group>
        <van-cell title="证件类型" value="身份证" />
        <van-cell title="号码" value="123456789012345678" />
        <van-cell title="姓名" value="XXX" />
        <van-cell title="性别" value="X" />
        <van-list
          v-model="loading"
          :finished="finished"
          finished-text=""
          @load="onLoad"
        >
          <van-cell v-for="item in list" :key="item" :title="item" />
        </van-list>
      </van-cell-group>
    </van-popup>

    <van-popup v-model="qrCodeShow" style="width: 350px"> </van-popup>
  </div>
</template>

<script>
import Vue from "vue";
import {
  List,
  Cell,
  CellGroup,
  Popup,
  Button,
  NavBar,
  Col,
  Row,
  Field,
} from "vant";

Vue.use(NavBar);
Vue.use(Col);
Vue.use(Row);
Vue.use(Field);
Vue.use(Button);
Vue.use(Popup);
Vue.use(Cell);
Vue.use(CellGroup);
Vue.use(List);

export default {
  data() {
    return {
      show: false,
      qrCodeShow: false,
      list: [],
      loading: false,
      finished: false,
    };
  },

  methods: {
    onClickLogin() {
      this.$router.push("welcome");
    },
    showPopup() {
      this.show = true;
    },
    showQrPopup() {
      this.qrCodeShow = true;
    },
    onLoad() {
      setTimeout(() => {
        for (let i = 0; i < 2; i++) {
          this.list.push(this.list.length + 1);
        }
        this.loading = false;

        if (this.list.length >= 2) {
          this.finished = true;
        }
      }, 1000);
    },
    onClickAppointment() {
      this.$router.push("/appointment");
    },
  },
};
</script>