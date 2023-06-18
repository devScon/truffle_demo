const Storage =  artifacts.require("SimpleStorage.sol");

contract('Storage', () => {
    it('SimpleStorage', async () => {
        const storage = await Storage.new();
        await storage.updateData(10);
        const data = await storage.readData();
        assert(data.toString()==='10');  
    });
});