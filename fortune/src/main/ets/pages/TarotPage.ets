import router from '@ohos.router';

@Entry
@Component
struct TarotPage {
  @State showResult: boolean = false;
  @State resultText: string = '';
  @State cardName: string = '';

  drawCard() {
    const cards = ['愚者', '魔术师', '女祭司', '皇后', '皇帝', '恋人', '战车', '力量', '隐士', '命运之轮'];
    const meanings = [
      "愚者牌代表新的开始和无限可能。您正处在人生的新起点，勇敢踏出第一步吧！",
      "魔术师象征创造力和意志力。现在是实现梦想的最佳时机，相信自己的能力。",
      "女祭司代表直觉和内在智慧。听从内心的声音，它会为您指引正确的方向。",
      "皇后牌象征创造力和母性关怀。您的温柔和包容会为您带来好运。",
      "皇帝代表权威和稳定。建立稳固的基础，成功将会到来。"
    ];
    
    const randomIndex = Math.floor(Math.random() * cards.length);
    this.cardName = cards[randomIndex];
    this.resultText = meanings[Math.min(randomIndex, meanings.length - 1)];
    this.showResult = true;
  }

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
        
        Text('塔罗占卜')
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
          .fontColor('#ffffff')
          .layoutWeight(1)
          .textAlign(TextAlign.Center)
        
        Text('   ')
          .fontSize(24)
      }
      .width('100%')
      .padding(20)
      
      if (!this.showResult) {
        Column({ space: 40 }) {
          Text('神秘塔罗牌')
            .fontSize(24)
            .fontColor('#ffd700')
            .margin({ top: 50 })
          
          Text('🃏')
            .fontSize(120)
            .margin({ top: 40, bottom: 40 })
          
          Text('静心冥想，点击抽取您的塔罗牌')
            .fontSize(16)
            .fontColor('#cccccc')
            .textAlign(TextAlign.Center)
            .width('80%')
          
          Button('抽取塔罗牌')
            .width('60%')
            .height(50)
            .fontSize(18)
            .backgroundColor('#ffd700')
            .fontColor('#1a1a2e')
            .borderRadius(25)
            .onClick(() => {
              this.drawCard();
            })
        }
        .width('100%')
        .justifyContent(FlexAlign.Center)
      } else {
        Scroll() {
          Column({ space: 20 }) {
            Text('塔罗牌占卜结果')
              .fontSize(24)
              .fontWeight(FontWeight.Bold)
              .fontColor('#ffd700')
              .margin({ top: 30 })
            
            Text('🃏')
              .fontSize(80)
              .margin({ top: 20, bottom: 20 })
            
            Text(this.cardName)
              .fontSize(20)
              .fontColor('#ffffff')
              .fontWeight(FontWeight.Bold)
            
            Column() {
              Text(this.resultText)
                .fontSize(16)
                .fontColor('#cccccc')
                .lineHeight(24)
                .textAlign(TextAlign.Start)
                .padding(20)
            }
            .width('90%')
            .backgroundColor('#533483')
            .borderRadius(15)
            
            Row({ space: 15 }) {
              Button('保存记录')
                .layoutWeight(1)
                .height(45)
                .backgroundColor('#0f3460')
                .fontColor('#ffffff')
                .borderRadius(22)
              
              Button('分享结果')
                .layoutWeight(1)
                .height(45)
                .backgroundColor('#ffd700')
                .fontColor('#1a1a2e')
                .borderRadius(22)
            }
            .width('90%')
            .margin({ top: 20 })
            
            Button('重新抽牌')
              .width('60%')
              .height(45)
              .fontSize(16)
              .backgroundColor('#16213e')
              .fontColor('#ffd700')
              .borderRadius(22)
              .margin({ top: 20 })
              .onClick(() => {
                this.showResult = false;
              })
          }
          .width('100%')
          .padding(20)
        }
        .layoutWeight(1)
      }
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#1a1a2e')
  }
}