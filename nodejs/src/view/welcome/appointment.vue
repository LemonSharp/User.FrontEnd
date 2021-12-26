<template>
  <div class="main">
    <van-nav-bar title="预约疫苗"></van-nav-bar>
    <br />
    <van-field
      v-model="fieldValue"
      is-link
      readonly
      label="区域"
      placeholder="点击选择接种点"
      @click="show = true"
    />
    <van-popup v-model="show" round position="bottom">
      <van-cascader
        v-model="cascaderValue"
        title="Select Area"
        :options="options"
        @close="show = false"
        @finish="onFinish"
      />
    </van-popup>

    <div>
      <van-cell
        title="选择接种日期"
        :value="date"
        @click="showCalendar = true"
      />
      <van-calendar
        v-model="showCalendar"
        @confirm="onConfirm"
        :max-date="maxDate"
      />
    </div>
    <br />
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
  Cascader,
  DatetimePicker,
  Calendar,
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
Vue.use(Cascader);
Vue.use(DatetimePicker);
Vue.use(Calendar);

function AddDayToDate(Time, days) {
  var a = new Date(Time);
  a = a.valueOf();
  a = a + days * 24 * 60 * 60 * 1000;
  a = new Date(a);
  return a;
}

export default {
  data() {
    return {
      show: false,
      fieldValue: "",
      cascaderValue: "",
      options: [
        {
          text: "浦东新区",
          value: "330000",
          children: [{ text: "A社区医院", value: "330100" }],
        },
        {
          text: "徐汇区",
          value: "320000",
          children: [{ text: "B社区医院", value: "320100" }],
        },
      ],
      minDate: new Date(),
      maxDate: AddDayToDate(new Date(), 30),
      currentDate: new Date(),
      date: "",
      showCalendar: false,
    };
  },

  methods: {
    onClickLogin() {
      this.$router.push("welcome");
    },
    showPopup() {
      this.show = true;
    },
    onFinish({ selectedOptions }) {
      this.show = false;
      this.fieldValue = selectedOptions.map((option) => option.text).join("/");
    },
    formatDate(date) {
      return `${date.getMonth() + 1}/${date.getDate()}`;
    },
    onConfirm(date) {
      this.showCalendar = false;
      this.date = this.formatDate(date);
    },
  },
};
</script>