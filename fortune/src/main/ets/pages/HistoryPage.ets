import router from '@ohos.router';

@Entry
@Component
struct HistoryPage {
  @State historyList: string[] = [
    '📝 张三的姓名分析 - 1月15日',
    '⭐ 白羊座今日运势 - 1月14日', 
    '🔮 李四的八字算命 - 1月13日',
    '🃏 塔罗牌占卜结果 - 1月12日',
    '📱 138****8888号码分析 - 1月11日'
  ];

  build() {
    Column() {
      // 顶部导航
      Row() {
        Button('←')
          .fontSize(24)
          .backgroundColor(Color.Transparent)
          .fontColor('#ffd700')
          .onClick(() => {
            router.back()
          })
        
        Text('历史记录')
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
          .fontColor('#ffffff')
          .layoutWeight(1)
          .textAlign(TextAlign.Center)
        
        Button('清空')
          .fontSize(16)
          .backgroundColor(Color.Transparent)
          .fontColor('#ff6b6b')
          .onClick(() => {
            this.historyList = [];
          })
      }
      .width('100%')
      .padding(20)
      
      if (this.historyList.length === 0) {
        Column() {
          Text('📜')
            .fontSize(64)
            .margin({ bottom: 20 })
          
          Text('暂无历史记录')
            .fontSize(18)
            .fontColor('#cccccc')
            .margin({ bottom: 10 })
          
          Text('快去体验各种算命功能吧！')
            .fontSize(14)
            .fontColor('#999999')
        }
        .width('100%')
        .layoutWeight(1)
        .justifyContent(FlexAlign.Center)
      } else {
        Column() {
          Text(`共${this.historyList.length}条记录`)
            .fontSize(16)
            .fontColor('#cccccc')
            .margin({ bottom: 20 })
          
          List({ space: 10 }) {
            ForEach(this.historyList, (item: string, index: number) => {
              ListItem() {
                Row() {
                  Text(item)
                    .fontSize(16)
                    .fontColor('#ffffff')
                    .layoutWeight(1)
                  
                  Button('删除')
                    .fontSize(12)
                    .backgroundColor('#ff6b6b')
                    .fontColor('#ffffff')
                    .borderRadius(15)
                    .onClick(() => {
                      this.historyList.splice(index, 1);
                    })
                }
                .width('100%')
                .padding(15)
                .backgroundColor('#533483')
                .borderRadius(10)
              }
            })
          }
          .width('100%')
          .layoutWeight(1)
        }
        .width('100%')
        .padding(20)
        .layoutWeight(1)
      }
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#1a1a2e')
  }
}