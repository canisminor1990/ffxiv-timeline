const fs   = require('fs-extra');
const path = require('path');
const root = path.join(__dirname, '../resources');
let files  = [];
readDirSync(root, root, 'ffxiv-timeline-master/resources');
console.log(JSON.stringify(files, null, 2));

function readDirSync(rootPath, rootBackup, rootName) {
	const pa = fs.readdirSync(rootPath);
	pa.forEach(ele => {
		if (ele === '.DS_Store') return;
		const newPa = path.join(rootPath, ele);
		const info  = fs.statSync(newPa);
		info.isDirectory()
		? readDirSync(newPa, rootBackup, rootName)
		: files.push(path.join(rootName, newPa.replace(rootBackup, '')));
	});
}