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
      @click="onSiteClick"
    />
    <van-popup v-model="show" round position="bottom">
      <van-cascader
        v-model="cascaderValue"
        title="Select Area"
        :options="vaccOptions"
        @close="show = false"
        @finish="onFinish"
      />
    </van-popup>

    <van-dropdown-menu @click="onSiteClick">
      <van-dropdown-item v-model="value1" :options="option1" />
    </van-dropdown-menu>

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
import axios from "axios";
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
  DropdownMenu, 
  DropdownItem
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
Vue.use(DropdownMenu);
Vue.use(DropdownItem);

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
      vaccOptions: [
        {
          text: "浦东新区",
          value: "330000",
          children: [],
        },
      ],
      minDate: new Date(),
      maxDate: AddDayToDate(new Date(), 30),
      currentDate: new Date(),
      date: "",
      showCalendar: false,
      value1: 0,
      option1: [
      ],
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
    onPageLoad() {
      
    },
    onSiteClick() {
      this.show = true;
    },
  },

  mounted: function(){
    var _this = this;
    _this.$axios.get("/api/VaccinationSite/GetVaccination")
        .then(function (response) {
          var _this = this
          console.log(response);
          var arrayObj = new Array();
          for (let index = 0; index < response.data.length; index++) {
            const element = response.data[index];
            console.log(element.siteName)
            arrayObj.push({ text: element.siteName, value: element.siteId });
          }
          console.log(arrayObj);
          _this.option1 = arrayObj;
        });
  },
};
</script>