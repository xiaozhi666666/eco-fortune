import router from '@ohos.router';

@Entry
@Component
struct PhoneAnalysisPage {
  @State phoneNumber: string = '';
  @State showResult: boolean = false;
  @State resultText: string = '';
  @State score: number = 0;

  analyzePhone() {
    if (this.phoneNumber.length !== 11) {
      return;
    }
    
    this.score = Math.floor(Math.random() * 30) + 70; // 70-99分
    
    const results = [
      "您的手机号码整体能量平衡，有利于各方面发展。数字组合寓意财运亨通。",
      "号码显示您具有很强的领导能力和创新思维，事业运势良好。",
      "从数字分析看，您的号码有助于人际关系发展，贵人运旺盛。",
      "手机号码数理吉祥，预示着稳定发展和持续的好运。建议长期使用。"
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
        
        Text('号码分析')
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
          Text('手机号码吉凶分析')
            .fontSize(20)
            .fontColor('#ffd700')
            .margin({ top: 50 })
          
          TextInput({ placeholder: '请输入11位手机号码' })
            .width('80%')
            .height(50)
            .backgroundColor('#533483')
            .fontColor('#ffffff')
            .placeholderColor('#cccccc')
            .type(InputType.Number)
            .maxLength(11)
            .onChange((value) => {
              this.phoneNumber = value;
            })
          
          Text('基于数字的五行属性和组合规律分析')
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
            .opacity(this.phoneNumber.length === 11 ? 1.0 : 0.5)
            .onClick(() => {
              if (this.phoneNumber.length === 11) {
                this.analyzePhone();
              }
            })
        }
        .width('100%')
        .justifyContent(FlexAlign.Center)
      } else {
        Scroll() {
          Column({ space: 20 }) {
            Text('号码分析结果')
              .fontSize(24)
              .fontWeight(FontWeight.Bold)
              .fontColor('#ffd700')
              .margin({ top: 30 })
            
            Text(`${this.phoneNumber}`)
              .fontSize(18)
              .fontColor('#ffffff')
              .margin({ bottom: 10 })
            
            // 评分显示
            Column() {
              Text(`${this.score}分`)
                .fontSize(48)
                .fontWeight(FontWeight.Bold)
                .fontColor('#ffd700')
                .margin({ bottom: 10 })
              
              Text(this.score >= 85 ? '大吉' : this.score >= 70 ? '吉' : '平')
                .fontSize(18)
                .fontColor(this.score >= 85 ? '#00ff7f' : this.score >= 70 ? '#ffd700' : '#cccccc')
            }
            .width('90%')
            .backgroundColor('#533483')
            .borderRadius(15)
            .padding(20)
            .margin({ bottom: 15 })
            
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
                this.phoneNumber = '';
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