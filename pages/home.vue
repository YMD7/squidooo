<template lang="pug">
section
  .notice
    h2
      | 現在、抽選申込期間中です
  .calendar
    .calendar-month
      time
        | {{ month }}月
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
        li(v-for="(date, i) in dates" :class="[date.isHoliday, date.type, date.isCurrentDate ? 'current' : '']")
          | {{ date.number }}
    section.field
      .remarks
        ul
          li.apply 抽選申込期間
          li.draw 抽選日
          li.comfirm 抽選結果確認期間
      .options
        ol
          li
            .chart.apply-option
            .description
              p
                | あと
                span.number.strong
                  | 9999
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
                  | {{ daysToDraw }}
                | 日後まで可能です
            .button
              button
                span.small
                  | 抽選申込の
                br
                | 確認/取消
          li
            .chart.comfirm-option
            .description
              p
                | 抽選結果の確認は
                span.number
                  | {{ daysToComfirm }}
                | 日後から可能です
            .button
              button.disable
                | 当選確認
</template>

<script>
import dayjs from 'dayjs'

dayjs.locale({ weekStart: 1 })
const d = dayjs()
const startDate = d.startOf('week').add(-1, 'week')
const calendarDates = (() => {
  let n = 21
  let array = []
  while (n > 0) {
    const date = startDate.add(n - 1, 'day')
    const number = date.date()
    const isHoliday = date.day() === 0 || date.day() === 6 ? 'holiday' : ''
    let type = ''
    if (number === 1) {
      type = 'draw'
    } else if (number > 1 && number <= 7) {
      type = 'comfirm'
    } else if (number >= 15) {
      type = 'apply'
    }
    const isCurrentDate = number === d.date() ? 1 : 0
    array = [
      {
        number: number,
        isHoliday: isHoliday,
        type: type,
        isCurrentDate: isCurrentDate
      }
    ].concat(array)
    n--
  }
  return array
})()

export default {
  data() {
    return {
      month: d.month() + 1,
      dates: calendarDates,
      daysToDraw: d.endOf('month').date() - d.date(),
      daysToComfirm: d.endOf('month').date() - d.date() + 2
    }
  }
}
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
  font-size 1.08rem
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

.draw
  background-color #000000
  color #FFFFFF

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
  line-height 100%

  > span
    font-size 75%

.disable
  cursor not-allowed
  border-color #CCCCCC
  background-color #CCCCCC
  box-shadow 0 0
  color #999999
</style>
