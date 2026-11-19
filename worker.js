// هذا المستودع للعقود الذكية (Solidity) فقط
// Worker وهمي لمنع فشل البناء التلقائي في Cloudflare
export default {
  async fetch() {
    return new Response('Basl - Smart contracts repo. See contracts: SimpleERC20, APENFT, Pausable, TimelockToken', {
      headers: { 'content-type': 'text/plain; charset=utf-8' },
    });
  },
};
