export enum ExperienceMode {
  SOCIAL = 'SOCIAL',
  PROFESSIONAL = 'PROFESSIONAL',
  METASPHERE = 'METASPHERE',
  GRID = 'GRID',
  CITY_OPS = 'CITY_OPS',
  SYSTEM = 'SYSTEM'
}

export enum PanelType {
  CHAT = 'CHAT',
  NEWS = 'NEWS',
  CALL = 'CALL',
  MARKET = 'MARKET',
  AI_COMMAND = 'AI_COMMAND',
  EXCHANGE = 'EXCHANGE',
  NOTIFICATIONS = 'NOTIFICATIONS'
}

export interface Sphere {
  id: string;
  name: string;
  code: string;
  color: string;
  flag: string;
  lat: number;
  lng: number;
}

export interface Post {
  id: string;
  author: string;
  avatar: string;
  description: string;
  sphereId: string;
  likes: number;
  shares: number;
  type: 'video' | 'live' | 'commerce';
  thumbnailUrl: string;
  productPrice?: string;
}

export interface MarketData {
  symbol: string;
  value: number;
  change: number;
}

export interface ChatMessage {
  id: string;
  role: 'user' | 'model';
  text: string;
}

export interface Panel {
  id: string;
  type: PanelType;
  title: string;
  position: { x: number; y: number };
  size: { width: number; height: number };
  zIndex: number;
  isMaximized?: boolean;
  isMinimized?: boolean;
  prevPosition?: { x: number; y: number };
  prevSize?: { width: number; height: number };
}

export interface SystemModule {
  id: string;
  name: string;
  status: 'DEPLOYED' | 'OPTIMIZING' | 'OFFLINE';
  category: string;
  regions: string[];
}

export interface SphereTrait {
  id: string;
  sphereId: string;
  engineName: string;
  threatLevel: 'LOW' | 'MED' | 'HIGH' | 'CRITICAL';
  sensorType: string;
  dataCurrency: string;
  dominantFaction: string;
  specialFeature: string;
  description: string;
}

export interface AIAgent {
  id: string;
  name: string;
  role: string;
  status: 'ACTIVE' | 'LEARNING' | 'IDLE';
  efficiency: number;
  currentTask: string;
  scale: string;
}

export interface TradeTicker {
  symbol: string;
  price: number;
  change24h: number;
  volume24h: string;
}

export interface OrderBookEntry {
  price: number;
  amount: number;
  total: number;
  type: 'BID' | 'ASK';
  depthPercent: number;
}

export interface OpenOrder {
  id: string;
  symbol: string;
  type: 'MARKET' | 'LIMIT';
  side: 'BUY' | 'SELL';
  price: number;
  amount: number;
  filled: number;
  status: 'NEW' | 'PARTIAL' | 'FILLED';
  time: string;
}

export interface CryptoAsset {
  id: string;
  symbol: string;
  name: string;
  image: string;
  current_price: number;
  market_cap: number;
  market_cap_rank: number;
  total_volume: number;
  price_change_percentage_24h: number;
  balance?: number;
  valueAED?: number;
  pnl?: number;
  coin?: string;
}

export interface PortfolioAsset {
  coin: string;
  name: string;
  balance: number;
  valueAED: number;
  pnl: number;
}

export interface CryptoExchange {
  id: string;
  name: string;
  year_established: number;
  country: string;
  description: string;
  url: string;
  image: string;
  trust_score: number;
  trust_score_rank: number;
  trade_volume_24h_btc: number;
}

export interface BankConnection {
  id: string;
  name: string;
  logo: string;
  status: 'DISCONNECTED' | 'HANDSHAKE' | 'CONNECTED';
  apiKey?: string;
  accountNumber?: string;
}

export interface AISignal {
  id: string;
  symbol: string;
  type: 'BUY' | 'SELL';
  confidence: number;
  timestamp: string;
}

export interface AppNotification {
  id: string;
  type: 'TRADE' | 'ALERT' | 'SOCIAL' | 'SYSTEM';
  title: string;
  message: string;
  timestamp: string;
  isRead: boolean;
  targetPanel?: PanelType;
}
