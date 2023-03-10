Функция РозничнаяЦена(Период, Номенклатура) Экспорт
	Запрос = Новый Запрос;
	Запрос.Текст =
		"ВЫБРАТЬ
		|	ЦеныСрезПоследних.Цена
		|ИЗ
		|	РегистрСведений.Цены.СрезПоследних(&Период, Номенклатура = &Номенклатура) КАК ЦеныСрезПоследних";
	
	Запрос.УстановитьПараметр("Номенклатура", Номенклатура);
	Запрос.УстановитьПараметр("Период", Период);
	
	РезультатЗапроса = Запрос.Выполнить();
	
	Выборка = РезультатЗапроса.Выбрать();
	
	Если Выборка.Следующий() Тогда
		Возврат Выборка.Цена;
	Иначе
		Возврат 0;
	КонецЕсли;
КонецФункции