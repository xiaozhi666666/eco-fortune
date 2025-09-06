import router from '@ohos.router';
import { HistoryManager } from '../common/HistoryManager';

@Entry
@Component
struct ZodiacPage {
  @State selectedZodiac: string = '';
  @State showResult: boolean = false;
  @State resultText: string = '';
  private historyManager: HistoryManager = HistoryManager.getInstance();
  
  private zodiacNames: string[] = [
    '白羊座', '金牛座', '双子座', '巨蟹座', 
    '狮子座', '处女座', '天秤座', '天蝎座',
    '射手座', '摩羯座', '水瓶座', '双鱼座'
  ];

  generateFortune() {
    const fortunes = [
      "今日运势极佳，是展现才华的好时机。爱情运势甜蜜，事业蒸蒸日上。",
      "整体运势平稳上升，财运不错。建议保持积极心态，好运即将到来。",
      "今天适合处理重要事务，人际关系运势良好，容易得到他人帮助。",
      "创意灵感丰富，适合开展新项目。感情方面可能有意外惊喜。"
    ];
    
    this.resultText = fortunes[Math.floor(Math.random() * fortunes.length)];
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
        
        Text('星座运势')
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
        Column({ space: 20 }) {
          Text('请选择您的星座')
            .fontSize(20)
            .fontColor('#ffd700')
            .margin({ top: 30 })
          
          Grid() {
            ForEach(this.zodiacNames, (name: string) => {
              GridItem() {
                Button(name)
                  .width('100%')
                  .height(50)
                  .fontSize(14)
                  .backgroundColor(this.selectedZodiac === name ? '#ffd700' : '#533483')
                  .fontColor(this.selectedZodiac === name ? '#1a1a2e' : '#ffffff')
                  .borderRadius(10)
                  .onClick(() => {
                    this.selectedZodiac = name;
                  })
              }
            })
          }
          .columnsTemplate('1fr 1fr 1fr')
          .rowsTemplate('1fr 1fr 1fr 1fr')
          .width('90%')
          .height(300)
          .columnsGap(10)
          .rowsGap(10)
          
          Button('查看今日运势')
            .width('60%')
            .height(50)
            .fontSize(18)
            .backgroundColor('#ffd700')
            .fontColor('#1a1a2e')
            .borderRadius(25)
            .opacity(this.selectedZodiac ? 1.0 : 0.5)
            .onClick(() => {
              if (this.selectedZodiac) {
                this.generateFortune();
              }
            })
        }
        .width('100%')
        .justifyContent(FlexAlign.Center)
      } else {
        Scroll() {
          Column({ space: 20 }) {
            Text(`${this.selectedZodiac}今日运势`)
              .fontSize(24)
              .fontWeight(FontWeight.Bold)
              .fontColor('#ffd700')
              .margin({ top: 30 })
            
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
            
            Button('保存记录')
              .width('60%')
              .height(45)
              .backgroundColor('#0f3460')
              .fontColor('#ffffff')
              .borderRadius(22)
              .onClick(() => {
                // 保存记录到历史
                this.historyManager.addHistory(
                  'zodiac',
                  `⭐ ${this.selectedZodiac}今日运势`,
                  this.resultText
                );
                console.info('保存星座运势记录：' + this.selectedZodiac);
              })
            .width('90%')
            .margin({ top: 20 })
            
            Button('重新选择')
              .width('60%')
              .height(45)
              .fontSize(16)
              .backgroundColor('#16213e')
              .fontColor('#ffd700')
              .borderRadius(22)
              .margin({ top: 20 })
              .onClick(() => {
                this.showResult = false;
                this.selectedZodiac = '';
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