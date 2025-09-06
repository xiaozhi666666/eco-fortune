import router from '@ohos.router';
import { HistoryManager, HistoryItem } from '../common/HistoryManager';

@Entry
@Component
struct HistoryPage {
  @State historyList: HistoryItem[] = [];
  private historyManager: HistoryManager = HistoryManager.getInstance();
  
  aboutToAppear() {
    this.historyList = this.historyManager.getHistoryList();
  }
  
  // 删除历史记录项
  deleteHistoryItem(id: string) {
    this.historyManager.deleteHistory(id);
    this.historyList = this.historyManager.getHistoryList();
  }
  
  // 清空所有历史记录
  clearAllHistory() {
    this.historyManager.clearAllHistory();
    this.historyList = this.historyManager.getHistoryList();
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
            this.clearAllHistory();
            console.info('清空历史记录');
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
            ForEach(this.historyList, (item: HistoryItem) => {
              ListItem() {
                Row() {
                  Column({ space: 5 }) {
                    Text(`${item.title} - ${item.timestamp}`)
                      .fontSize(16)
                      .fontColor('#ffffff')
                      .maxLines(1)
                      .textOverflow({ overflow: TextOverflow.Ellipsis })
                    
                    Text(item.content)
                      .fontSize(12)
                      .fontColor('#cccccc')
                      .maxLines(2)
                      .textOverflow({ overflow: TextOverflow.Ellipsis })
                  }
                  .layoutWeight(1)
                  .alignItems(HorizontalAlign.Start)
                  
                  Button('删除')
                    .fontSize(12)
                    .backgroundColor('#ff6b6b')
                    .fontColor('#ffffff')
                    .borderRadius(15)
                    .onClick(() => {
                      this.deleteHistoryItem(item.id);
                      console.info('删除历史记录：' + item.title);
                    })
                }
                .width('100%')
                .padding(15)
                .backgroundColor('#533483')
                .borderRadius(10)
              }
            }, (item: HistoryItem) => item.id)
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