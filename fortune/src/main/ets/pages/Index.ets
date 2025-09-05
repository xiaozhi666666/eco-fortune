import router from '@ohos.router';

@Entry
@Component
struct Index {
  @State message: string = '玄机算命';

  build() {
    Column() {
      // 标题
      Text(this.message)
        .fontSize(32)
        .fontWeight(FontWeight.Bold)
        .fontColor('#ffd700')
        .margin({ top: 50, bottom: 30 })
      
      Text('探索命运奥秘，洞察人生玄机')
        .fontSize(16)
        .fontColor('#cccccc')
        .margin({ bottom: 50 })
      
      // 功能按钮
      Column({ space: 20 }) {
        Button('🔮 八字算命')
          .width('80%')
          .height(60)
          .fontSize(18)
          .backgroundColor('#533483')
          .fontColor('#ffffff')
          .borderRadius(15)
          .onClick(() => {
            router.pushUrl({ url: 'pages/BaziPage' })
          })
        
        Button('⭐ 星座运势')
          .width('80%')
          .height(60)
          .fontSize(18)
          .backgroundColor('#0f3460')
          .fontColor('#ffffff')
          .borderRadius(15)
          .onClick(() => {
            router.pushUrl({ url: 'pages/ZodiacPage' })
          })
        
        Button('🃏 塔罗占卜')
          .width('80%')
          .height(60)
          .fontSize(18)
          .backgroundColor('#533483')
          .fontColor('#ffffff')
          .borderRadius(15)
          .onClick(() => {
            router.pushUrl({ url: 'pages/TarotPage' })
          })
        
        Button('📝 姓名测试')
          .width('80%')
          .height(60)
          .fontSize(18)
          .backgroundColor('#0f3460')
          .fontColor('#ffffff')
          .borderRadius(15)
          .onClick(() => {
            router.pushUrl({ url: 'pages/NameTestPage' })
          })
        
        Button('📱 号码分析')
          .width('80%')
          .height(60)
          .fontSize(18)
          .backgroundColor('#533483')
          .fontColor('#ffffff')
          .borderRadius(15)
          .onClick(() => {
            router.pushUrl({ url: 'pages/PhoneAnalysisPage' })
          })
      }
      .width('100%')
      .justifyContent(FlexAlign.Center)
      
      Blank()
      
      Button('历史记录')
        .width('60%')
        .height(45)
        .fontSize(16)
        .backgroundColor('#16213e')
        .fontColor('#ffd700')
        .borderRadius(25)
        .margin({ bottom: 30 })
        .onClick(() => {
          router.pushUrl({ url: 'pages/HistoryPage' })
        })
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#1a1a2e')
    .alignItems(HorizontalAlign.Center)
    .justifyContent(FlexAlign.Start)
  }
}