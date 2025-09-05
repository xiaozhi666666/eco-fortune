import router from '@ohos.router';

@Entry
@Component
struct NameTestPage {
  @State name: string = '';
  @State showResult: boolean = false;
  @State resultText: string = '';

  analyzeName() {
    if (this.name.trim() === '') {
      return;
    }
    
    const results = [
      "您的姓名数理很好，寓意吉祥如意。性格温和，人缘极佳，事业发展顺利。",
      "从姓名分析看，您具有领导才能，适合从事管理工作。财运不错，家庭和睦。",
      "姓名显示您聪明伶俐，学习能力强。在文化艺术方面有特殊天赋。",
      "您的姓名包含着积极的能量，有助于人际关系和事业发展。建议保持现有姓名。"
    ];
    
    this.resultText = results[Math.floor(Math.random() * results.length)];
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
        
        Text('姓名测试')
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
        Column({ space: 30 }) {
          Text('姓名五格测试')
            .fontSize(20)
            .fontColor('#ffd700')
            .margin({ top: 50 })
          
          TextInput({ placeholder: '请输入完整姓名' })
            .width('80%')
            .height(50)
            .backgroundColor('#533483')
            .fontColor('#ffffff')
            .placeholderColor('#cccccc')
            .onChange((value) => {
              this.name = value;
            })
          
          Text('根据姓名的笔画数分析五格数理吉凶')
            .fontSize(14)
            .fontColor('#cccccc')
            .textAlign(TextAlign.Center)
            .width('80%')
          
          Button('开始分析')
            .width('60%')
            .height(50)
            .fontSize(18)
            .backgroundColor('#ffd700')
            .fontColor('#1a1a2e')
            .borderRadius(25)
            .onClick(() => {
              this.analyzeName();
            })
        }
        .width('100%')
        .justifyContent(FlexAlign.Center)
      } else {
        Scroll() {
          Column({ space: 20 }) {
            Text('姓名分析结果')
              .fontSize(24)
              .fontWeight(FontWeight.Bold)
              .fontColor('#ffd700')
              .margin({ top: 30 })
            
            Text(`${this.name}的姓名分析`)
              .fontSize(18)
              .fontColor('#ffffff')
              .margin({ bottom: 20 })
            
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
            
            Button('重新测试')
              .width('60%')
              .height(45)
              .fontSize(16)
              .backgroundColor('#16213e')
              .fontColor('#ffd700')
              .borderRadius(22)
              .margin({ top: 20 })
              .onClick(() => {
                this.showResult = false;
                this.name = '';
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