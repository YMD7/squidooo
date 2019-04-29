<template lang="pug">
section
  .notice
    h2
      | 現在、抽選申込期間中です
  .calendar
    .calendar-month
      time
        | 4月
    .calendar-table
      ol.week-header
        li 月
        li 火
        li 水
        li 木
        li 金
        li.holiday 土
        li.holiday 日
      ol.week-dates
        li.apply 15
        li.apply 16
        li.apply 17
        li.apply 18
        li.apply 19
        li.apply.holiday 20
        li.apply.holiday 21
        li.apply 22
        li.apply 23
        li.apply 24
        li.apply.current 25
        li.apply 26
        li.apply.holiday 27
        li.apply.holiday 28
        li.apply 29
        li.apply 30
        li 1
        li.comfirm 2
        li.comfirm 3
        li.comfirm.holiday 4
        li.comfirm.holiday 5
    section.field
      .remarks
        ul
          li.apply 抽選申込期間
          li.comfirm 当選確認期間
      .options
        ol
          li
            .chart.apply-option
            .description
              p
                | あと
                span.number.strong
                  | 4
                | 件の申込が可能です
            .button
              button
                | 抽選申込
          li
            .chart.change-option
            .description
              p
                | 申込の確認や取消は
                span.number
                  | 4
                | 日後まで可能です
            .button
              button
                | 確認/取消
          li
            .chart.comfirm-option
            .description
              p
                | 抽選結果の確認は
                span.number
                  | 6
                | 日後から可能です
            .button
              button.disable
                | 当選確認
</template>

<script>
</script>

<style scoped lang="stylus">
section
  flex 1
  display flex
  flex-direction column
  padding 0 1.4%

h2
  border 2px solid #000000
  border-radius 6px
  background-color #FFFFFF
  padding 0.25rem
  font-size 0.88rem
  text-indent 0.20rem

.calendar
  display flex
  flex-direction column
  margin-top 18px

.calendar-month
  margin-top 6px
  margin-left auto

time
  border-top-left-radius 10px
  border-top-right-radius 10px
  background-color #000000
  box-shadow 1px 1px #000000
  padding 10px 24px
  color #FFFFFF
  font-family "Yu Gothic", YuGothic, Meiryo
  font-size 0.80rem

.calendar-table
  display flex
  flex-direction column
  box-shadow 5px 7px #000000
  margin-right 4px
  font-size 0.96rem
  li
    width 14.28%
    text-align center

.week-header
  display flex
  border-top-left-radius 10px
  background-color #000000
  color #FFFFFF
  font-size 0.75rem
  li
    padding 4px 0

.week-dates
  display flex
  flex-wrap wrap
  background-color #FFFFFF
  li
    border-bottom 4px solid #000000
    padding 12px

.holiday
  color calendar-holiday

.current
  background url('~assets/images/CalendarEllipse.svg') no-repeat center center
  background-size 70%

.apply
  background-color calendar-apply

.comfirm
  background-color calendar-comfirm

.field
  border-bottom-left-radius 10px
  border-bottom-right-radius 10px
  background-color #FFFFFF
  box-shadow 5px 7px #000000
  margin-right 4px

.remarks
  padding 12px 6px
  ul
    display flex
  li
    margin-right 8px
    padding 0 6px
    font-size 0.75rem

.options
  padding 8px 14px
  li
    display flex
    height 98px

.chart
  background-repeat no-repeat
  width 32px

.apply-option
  background-image url('~assets/images/ApplyIndicator.svg')
  background-position center bottom
.change-option
  background-image url('~assets/images/ChangeIndicator.svg')
  background-position center center
.comfirm-option
  background-image url('~assets/images/ComfirmIndicator.svg')
  background-position center top

.description
  flex 1
  display flex
  align-items center
  padding 0 18px
  font-size 0.90rem

.number
  font-size 120%
  margin 0.10rem

.strong
  color sq-red

.button
  display flex
  align-items center

button
  border 4px solid #000000
  border-radius 10px
  background-color #FFFFFF
  box-shadow 5px 6px #F0F6EF
  width 100px
  height 52px

.disable
  cursor not-allowed
  border-color #4D4F4C
  background-color #DDDDDD
  box-shadow 0 0
  color #999999
</style>
