export interface HistoryItem {
  id: string;
  type: string;
  title: string;
  content: string;
  timestamp: string;
}

export class HistoryManager {
  private static instance: HistoryManager;
  private historyList: HistoryItem[] = [
    {
      id: '1',
      type: 'name',
      title: '📝 张三的姓名分析',
      content: '您的姓名数理很好，寓意吉祥如意。',
      timestamp: '1月15日'
    },
    {
      id: '2',
      type: 'zodiac',
      title: '⭐ 白羊座今日运势',
      content: '今日运势极佳，是展现才华的好时机。',
      timestamp: '1月14日'
    },
    {
      id: '3',
      type: 'bazi',
      title: '🔮 李四的八字算命',
      content: '您命中贵人相助，事业有成。',
      timestamp: '1月13日'
    },
    {
      id: '4',
      type: 'tarot',
      title: '🃏 塔罗牌占卜结果',
      content: '愚者牌代表新的开始和无限可能。',
      timestamp: '1月12日'
    },
    {
      id: '5',
      type: 'phone',
      title: '📱 138****8888号码分析',
      content: '您的手机号码整体能量平衡。',
      timestamp: '1月11日'
    }
  ];
  
  public static getInstance(): HistoryManager {
    if (!HistoryManager.instance) {
      HistoryManager.instance = new HistoryManager();
    }
    return HistoryManager.instance;
  }
  
  public getHistoryList(): HistoryItem[] {
    return [...this.historyList];
  }
  
  public addHistory(type: string, title: string, content: string): void {
    const newItem: HistoryItem = {
      id: Date.now().toString(),
      type: type,
      title: title,
      content: content,
      timestamp: this.getCurrentDate()
    };
    
    this.historyList.unshift(newItem);
    console.info('添加历史记录：', newItem);
  }
  
  public deleteHistory(id: string): void {
    const index = this.historyList.findIndex(item => item.id === id);
    if (index !== -1) {
      this.historyList.splice(index, 1);
      console.info('删除历史记录：', id);
    }
  }
  
  public clearAllHistory(): void {
    this.historyList = [];
    console.info('清空所有历史记录');
  }
  
  private getCurrentDate(): string {
    const now = new Date();
    const month = now.getMonth() + 1;
    const day = now.getDate();
    return `${month}月${day}日`;
  }
}