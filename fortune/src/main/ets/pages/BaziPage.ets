import router from '@ohos.router';
import { HistoryManager } from '../common/HistoryManager';

@Entry
@Component
struct BaziPage {
  @State name: string = '';
  @State showResult: boolean = false;
  @State resultText: string = '';
  private historyManager: HistoryManager = HistoryManager.getInstance();

  calculateBazi() {
    if (this.name.trim() === '') {
      return;
    }
    
    const results = [
      "您命中贵人相助，事业有成，财运亨通。性格温和善良，具有很强的包容心。",
      "八字显示您天资聪颖，学业有成，适合在文化教育领域发展。事业运势良好。",
      "从八字分析看，您财星高照，善于理财，一生不缺钱财。感情生活稳定。",
      "命理显示您意志坚毅，不轻易放弃。为人热情开朗，乐于助人，深受朋友喜爱。"
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
        
        Text('八字算命')
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
      .justifyContent(FlexAlign.SpaceBetween)
      
      if (!this.showResult) {
        // 输入界面
        Column({ space: 30 }) {
          Text('请输入您的姓名')
            .fontSize(20)
            .fontColor('#ffd700')
            .margin({ top: 50 })
          
          TextInput({ placeholder: '请输入姓名' })
            .width('80%')
            .height(50)
            .backgroundColor('#533483')
            .fontColor('#ffffff')
            .placeholderColor('#cccccc')
            .onChange((value) => {
              this.name = value;
            })
          
          Text('简化版：仅需输入姓名即可获得八字分析')
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
              this.calculateBazi();
            })
        }
        .width('100%')
        .justifyContent(FlexAlign.Center)
      } else {
        // 结果界面
        Scroll() {
          Column({ space: 20 }) {
            Text('八字分析结果')
              .fontSize(24)
              .fontWeight(FontWeight.Bold)
              .fontColor('#ffd700')
              .margin({ top: 30 })
            
            Text(`${this.name}的命理分析`)
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
            
            Button('保存记录')
              .width('60%')
              .height(45)
              .backgroundColor('#0f3460')
              .fontColor('#ffffff')
              .borderRadius(22)
              .onClick(() => {
                // 保存记录到历史
                this.historyManager.addHistory(
                  'bazi',
                  `🔮 ${this.name}的八字算命`,
                  this.resultText
                );
                console.info('保存八字算命记录：' + this.name);
              })
            .width('90%')
            .margin({ top: 20 })
            
            Button('重新测算')
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